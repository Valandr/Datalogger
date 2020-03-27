class LogsController < ApplicationController
  def index
    @logs = Log.all

    filepath = 'hourly_production_170411.csv'

    CSV.foreach(filepath) do |row|
      # Here, row is an array of columns
      puts "#{row[0]} | #{row[1]} | #{row[2]}"
    end

    respond_to do |format|
      format.html
      format.csv { send_data Log.to_csv, filename: "logs-#{Date.yesterday}.csv" }
    end
  end
end
