using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ConsumerApi.Controllers
{
    [Route("[controller]")]
    public class DataController : ControllerBase
    {
        [Authorize]
        [HttpGet("getdata")]
        public IActionResult GetData()
        {
            // Current user claims are stored in the User property. You can use it to identity whether client logged in or not
            var user = HttpContext.User;
            return Ok("Some data!");
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("getMoreData")]
        public IActionResult GetMoreData()
        {
            // Current user claims are stored in the User property. You can use it to identity whether client logged in or not
            var user = HttpContext.User;
            return Ok("Some more data!");
        }
    }
}
