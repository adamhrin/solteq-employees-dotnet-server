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

        // PUT: api/YearSalaries/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutYearSalary([FromRoute] int id, [FromBody] YearSalary yearSalary)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != yearSalary.Year)
            {
                return BadRequest();
            }

            _context.Entry(yearSalary).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!YearSalaryExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
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
                if (YearSalaryExists(yearSalary.Year))
                {
                    return new StatusCodeResult(StatusCodes.Status409Conflict);
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetYearSalary", new { id = yearSalary.Year }, yearSalary);
        }

        // DELETE: api/YearSalaries/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteYearSalary([FromRoute] int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var yearSalary = await _context.YearSalary.FindAsync(id);
            if (yearSalary == null)
            {
                return NotFound();
            }

            _context.YearSalary.Remove(yearSalary);
            await _context.SaveChangesAsync();

            return Ok(yearSalary);
        }

        private bool YearSalaryExists(int id)
        {
            return _context.YearSalary.Any(e => e.Year == id);
        }
    }
}