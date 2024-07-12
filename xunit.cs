dotnet new xunit -o MyWebApp.Tests

using System.Threading.Tasks;
using FluentAssertions;
using FluentAssertions.Execution;
using FluentValidation.TestHelper;
using Xunit;

public class PrimeService
{
    [Fact]
    public void IsPrime_InputIs1_ReturnFalse()
    {
    }

   
    [InlineData(0)]
    [InlineData(1)]
    [Theory]
    [Theory, ClassData(typeof(ITestDataOk))]
    public void IsPrime_ValuesLessThan2_ReturnFalse(int value)
    {
       //Arrange

       //Act
       var result = await _validator.TestValidateAsync(command);

       //Assert
       using (new AssertionScope())
       {
         result.IsValid.Should().BeFalse();
       }
    }
}

using Xunit;

namespace Test
{
    public class IDataOk : TheoryData<ActionCommand>
    {
        public TestDataOk()
        {
           Add(new ActionCommand());
        }
    }
}
