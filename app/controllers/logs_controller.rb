class LogsController < ApplicationController
  def index
    @logs = Log.all

    respond_to do |format|
      format.html
      format.csv { send_data Log.to_csv, filename: "logs-#{Date.yesterday}.csv" }
    end
  end
end
