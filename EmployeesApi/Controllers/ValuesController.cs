using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
//using EmployeesApi.Models;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EmployeesApi.Controllers
{
    [Route("api/[controller]")]
    //[EnableCors]
    public class ValuesController : ControllerBase
    {

        //private List<Employee> employees = new List<Employee>();

        //public ValuesController()
        //{
        //    employees.Add(new Employee
        //    {
        //        Id = 1,
        //        Name = "Adam Hrin",
        //        Email = "adam.hrin@gmail.com",
        //        Phone = "+421 915 636 998",
        //        Birthday = "09.03.1997",
        //        Salaries = new List<Salaries>()
        //    });
        //}

        // GET: api/<controller>
        [HttpGet]
        public IEnumerable<Object> Get()
        {
            //return employees;
            return null;
        }

        // GET api/<controller>/5
        [HttpGet("{id}")]
        public Object Get(int id)
        {
            //return employees.FirstOrDefault(e => e.Id == id);
            return null;
        }

        // POST api/<controller>
        [HttpPost]
        public IActionResult Post([FromBody]Value value)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            //TODO save the value to DB
            return CreatedAtAction("Get", new {id = value.Id}, value);
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }

        public class Value
        {
            public int Id { get; set; }

            [MinLength(3)]
            public string Text { get; set; }
        }
    }
}
