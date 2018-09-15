module ShowHelper
  def date_display(show)
    show.date.strftime("%B %d, %Y")
  end
end
