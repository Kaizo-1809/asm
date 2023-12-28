using System.ComponentModel.DataAnnotations.Schema;

namespace asm.Models
{
    public class Book
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Detail { get; set; }
        public decimal Price { get; set; }
        public string? Picture { get; set; }

        [NotMapped]
        public IFormFile Image { get; set; }
        public int CategoryId { get; set; }
        public virtual ICollection<Category>? Category { get; set; }
    }
}
