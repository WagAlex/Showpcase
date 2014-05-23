class Booking < ActiveRecord::Base
  belongs_to :shop
  belongs_to :user

  validate :no_date_overlap

  def no_date_overlap
    #TODO Check if end_date > start_date
    if self.start_date >= self.end_date
      errors.add :end_date, "hgvhgvhgvhgv"
    end
    # TODO Check dates
    existing_bookings = Booking.where(shop_id: self.shop_id).where.not(id: self.id)
    start_date = self.start_date
    end_date = self.end_date

    existing_bookings.each do |existing_booking|

      if (start_date - existing_booking.end_date) * (existing_booking.start_date - end_date) >= 0
        errors.add :end_date, "fghjfghj"
      end
      # unless self.start_date > existing_booking.end_date
      #   errors.add :start_date, "Impossible start date; the space is already booked between #{existing_booking.start_date} and #{existing_booking.end_date}"
      # end
      # unless self.end_date < existing_booking.start_date
      #   errors.add :end_date, "Impossible end date; the space is already booked between #{existing_booking.start_date} and #{existing_booking.end_date}"
      # end
    end

  end
end
