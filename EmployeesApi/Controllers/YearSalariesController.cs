using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using EmployeesApi.Models;

namespace EmployeesApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class YearSalariesController : ControllerBase
    {
        private readonly EmployeesDbContext _context;

        public YearSalariesController(EmployeesDbContext context)
        {
            _context = context;
        }

        // GET: api/YearSalaries
        [HttpGet]
        public IEnumerable<YearSalary> GetYearSalary()
        {
            return _context.YearSalary;
        }



        // GET: api/YearSalaries/2018/1
        [HttpGet("{year}/{idEmployee}")]
        public async Task<IActionResult> GetYearSalary([FromRoute] int year, [FromRoute] int idEmployee)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var yearSalary = await _context.YearSalary.FindAsync(year, idEmployee);

            if (yearSalary == null)
            {
                return NotFound();
            }

            return Ok(yearSalary);
        }

        // PUT: api/YearSalaries/2010/1
        [HttpPut("{oldYear}/{idEmployee}")]
        public async Task<IActionResult> PutYearSalary([FromRoute] int oldYear, [FromRoute] int idEmployee, [FromBody] YearSalary yearSalary)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (idEmployee != yearSalary.IdEmployee)
            {
                return BadRequest();
            }

            // if client changed "year", create new row and delete the original row
            // otherwise just update
            if (oldYear != yearSalary.Year)
            {
                _context.YearSalary.Add(yearSalary);
                var oldSalaryRow = await _context.YearSalary.FindAsync(oldYear, idEmployee);
                _context.YearSalary.Remove(oldSalaryRow);
            }
            else
            {
                _context.Entry(yearSalary).State = EntityState.Modified;
            }

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!YearSalaryExists(oldYear, idEmployee))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            // return updated data
            return Ok(yearSalary);
        }

        // POST: api/YearSalaries
        [HttpPost]
        public async Task<IActionResult> PostYearSalary([FromBody] YearSalary yearSalary)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            _context.YearSalary.Add(yearSalary);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (YearSalaryExists(yearSalary.Year, yearSalary.IdEmployee))
                {
                    return new StatusCodeResult(StatusCodes.Status409Conflict);
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetYearSalary", new { year = yearSalary.Year, idEmployee = yearSalary.IdEmployee }, yearSalary);
        }

        // DELETE: api/YearSalaries/2018/1
        [HttpDelete("{year}/{idEmployee}")]
        public async Task<IActionResult> DeleteYearSalary([FromRoute] int year, [FromRoute] int idEmployee)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var yearSalary = await _context.YearSalary.FindAsync(year, idEmployee);
            if (yearSalary == null)
            {
                return NotFound();
            }

            _context.YearSalary.Remove(yearSalary);
            await _context.SaveChangesAsync();

            return Ok(yearSalary);
        }

        private bool YearSalaryExists(int year, int idEmployee)
        {
            return _context.YearSalary.Any(e => (e.Year == year && e.IdEmployee == idEmployee));
        }
    }
}