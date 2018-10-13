using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using EmployeesApi.Models;
using System.Reflection;
using EmployeesApi.Helpers;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Authorization;

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
        [HttpGet, Authorize]
        public IEnumerable<YearSalary> GetYearSalary()
        {
            return _context.YearSalary;
        }



        // GET: api/YearSalaries/2018/1
        [HttpGet("{year}/{idEmployee}"), Authorize]
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

        //GET api/YearSalaries/allYears
        [HttpGet("allYears"), Authorize]
        public IEnumerable<int> getAllYears()
        {
            return _context.YearSalary.Select(r => r.Year).Distinct();
        }

        //GET api/YearSalaries/average/2018
        [HttpGet("average/{year?}"), Authorize]
        public IEnumerable<MonthAverageSalaryHelper> GetAverageMonthsSalary([FromRoute] int? year)
        {
            // if year == null -> no 'where' condition (~where 1)
            // no grouping, used only because ef cannot use aggregate functions without it
            var dbResult = _context.YearSalary
                .Where(c => year == null ? true : (c.Year == year))
                .GroupBy(g => 1)
                .Select(r => new
                {
                    January = r.Average(i => i.Jan),
                    February = r.Average(i => i.Feb),
                    March = r.Average(i => i.Mar),
                    April = r.Average(i => i.Apr),
                    May = r.Average(i => i.May),
                    Jun = r.Average(i => i.Jun),
                    July = r.Average(i => i.Jul),
                    August = r.Average(i => i.Aug),
                    September = r.Average(i => i.Sep),
                    October = r.Average(i => i.Okt),
                    November = r.Average(i => i.Nov),
                    December = r.Average(i => i.Dec)
                });

            // this list represents all months’ average salaries data in given year 
            // (or all years if year not given)
            List<MonthAverageSalaryHelper> result = new List<MonthAverageSalaryHelper>();

            if (dbResult.ToArray().Length != 0)
            {
                // first item of result from db converted to array
                // (this array contains always only one item)
                var dbData = dbResult.ToArray()[0];

                // iterate through all the properties of current-year salaries
                foreach (PropertyInfo propInfo in dbData.GetType().GetProperties())
                {
                    // read only readable properties
                    if (propInfo.CanRead)
                    {
                        // gather all month’s data into object and populate list
                        // one MonthAverageSalaryHelper object represents one month’s average salary
                        var item = new MonthAverageSalaryHelper()
                        {
                            Name = propInfo.Name,
                            Value = (float)propInfo.GetValue(dbData)
                        };
                        result.Add(item);
                    }
                }
            }

            return result;
        }

        // PUT: api/YearSalaries/2010/1
        [HttpPut("{oldYear}/{idEmployee}"), Authorize]
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
        [HttpPost, Authorize]
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
        [HttpDelete("{year}/{idEmployee}"), Authorize]
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