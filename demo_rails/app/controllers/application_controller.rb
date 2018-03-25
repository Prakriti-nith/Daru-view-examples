class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    def charts
	    # set the library, to plot charts
		Daru::View.plotting_library = :highcharts

		# options for the charts
		opts = {
		      chart: {defaultSeriesType: 'line'},
		      title: {
		        text: 'Solar Employment Growth by Sector, 2010-2016'
		        },

		      subtitle: {
		          text: 'Source: thesolarfoundation.com'
		      },

		      yAxis: {
		          title: {
		              text: 'Number of Employees'
		          }
		      },
		      legend: {
		          layout: 'vertical',
		          align: 'right',
		          verticalAlign: 'middle'
		      },
		  }

		# data for the charts
		series_dt = ([{
		      name: 'Tokyo',
		      data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
		  }, {
		      name: 'London',
		      data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
		  }])

		# initialize
		@line_graph = Daru::View::Plot.new
		@line_graph.chart.options = opts
		@line_graph.chart.series_data = series_dt

	    render "charts" , layout: "application"
	end
end
