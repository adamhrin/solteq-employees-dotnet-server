using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

namespace EmployeesApi.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.CreateTable(
            //    name: "Employee",
            //    columns: table => new
            //    {
            //        Id = table.Column<int>(nullable: false)
            //            .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
            //        Name = table.Column<string>(unicode: false, maxLength: 50, nullable: true),
            //        Email = table.Column<string>(unicode: false, maxLength: 50, nullable: true),
            //        Phone = table.Column<string>(unicode: false, maxLength: 50, nullable: true)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK_Employee", x => x.Id);
            //    });

            //migrationBuilder.CreateTable(
            //    name: "YearSalary",
            //    columns: table => new
            //    {
            //        Year = table.Column<int>(nullable: false),
            //        Id_Employee = table.Column<int>(nullable: false),
            //        Jan = table.Column<float>(nullable: true),
            //        Feb = table.Column<float>(nullable: true),
            //        Mar = table.Column<float>(nullable: true),
            //        Apr = table.Column<float>(nullable: true),
            //        May = table.Column<float>(nullable: true),
            //        Jun = table.Column<float>(nullable: true),
            //        Jul = table.Column<float>(nullable: true),
            //        Aug = table.Column<float>(nullable: true),
            //        Sep = table.Column<float>(nullable: true),
            //        Okt = table.Column<float>(nullable: true),
            //        Nov = table.Column<float>(nullable: true),
            //        Dec = table.Column<float>(nullable: true)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK_YearSalary", x => new { x.Year, x.Id_Employee });
            //        table.ForeignKey(
            //            name: "FK_YearSalary_ToEmployee",
            //            column: x => x.Id_Employee,
            //            principalTable: "Employee",
            //            principalColumn: "Id",
            //            onDelete: ReferentialAction.Restrict);
            //    });

            //migrationBuilder.CreateIndex(
            //    name: "IX_YearSalary_Id_Employee",
            //    table: "YearSalary",
            //    column: "Id_Employee");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.DropTable(
            //    name: "YearSalary");

            //migrationBuilder.DropTable(
            //    name: "Employee");
        }
    }
}
