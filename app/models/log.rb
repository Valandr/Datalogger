class Log < ApplicationRecord
  belongs_to :onduleur

  def self.to_csv
    CSV.generate do |csv|
      column_names = %w[identifier datetime energy]
      csv << column_names
      all.each do |log|
        csv << log.attributes.values_at(*column_names)
      end
    end
  end
end
