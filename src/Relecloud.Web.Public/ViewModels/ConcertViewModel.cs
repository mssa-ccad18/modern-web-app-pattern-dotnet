using Microsoft.AspNetCore.Mvc.Rendering;
using Relecloud.Web.Models.ConcertContext;

namespace Relecloud.Web.Public.ViewModels
{
    public class ConcertViewModel
    {
        public Concert? Concert { get; set; }
    }
}
