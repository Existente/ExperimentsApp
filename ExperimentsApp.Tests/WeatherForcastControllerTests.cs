using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;
using ExperimentsApp.Controllers;
using Moq;
using Microsoft.Extensions.Logging;

namespace ExperimentsApp.Tests
{
    public class WeatherForcastControllerTests
    {
        Mock<ILogger<WeatherForecastController>> loggerMock;
        public WeatherForcastControllerTests()
        {
            loggerMock = new Mock<ILogger<WeatherForecastController>>();
        }
        [Fact]
        public void GetWeatherForecast_WhenSuccessful_ReturnsFiveElements()
        { 
            var expectedLength = 5;
            var controller = new WeatherForecastController(loggerMock.Object);
            var result = controller.Get();
            Assert.Equal(expectedLength, result.Count());
        }
    }
}
