using Microsoft.AspNetCore.Mvc.Rendering;
using System.Net.Sockets;

namespace asm.Models
{
    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public virtual Book? Book { get; set; }

    }
}
