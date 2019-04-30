class HomeController < ApplicationController
  def index
    current_credits = Invoice.all("WHERE YEAR(date) = YEAR(now()) AND MONTH(date) = MONTH(now()) AND type IS NULL or type NOT IN ('C1','C2')")
    current_debits = Invoice.all("WHERE YEAR(date) = YEAR(now()) AND MONTH(date) = MONTH(now()) AND type IN ('C1','C2')")
    render("index.ecr")
  end

  def quarter_historic
    quarters = Invoice.all("GROUP BY MONTH(date) ORDER BY YEAR(date) DESC")
    render("quarters.ecr")
  end

  def year_historic
    years = Invoice.all("GROUP BY YEAR(date) ORDER BY YEAR(date) DESC")
    render("years.ecr")
  end

  def year
    current_credits = Invoice.all("WHERE YEAR(date) = ? AND MONTH(date) BETWEEN ? AND ? AND type IS NULL OR type NOT IN ('C1','C2') OR YEAR(date) = ? AND MONTH(date) BETWEEN ? AND ? AND type IS NULL OR type NOT IN ('C1','C2')", [params[:fyear], params[:fmonths], params[:fmonthe], params[:lyear], params[:lmonths], params[:lmonthe]])
    current_debits = Invoice.all("WHERE YEAR(date) = ? AND MONTH(date) BETWEEN ? AND ? AND type IN ('C1','C2') OR YEAR(date) = ? AND MONTH(date) BETWEEN ? AND ? AND type IN ('C1','C2')", [params[:fyear], params[:fmonths], params[:fmonthe], params[:lyear], params[:lmonths], params[:lmonthe]])
    render("index.ecr")
  end

  def quarter
    current_credits = Invoice.all("WHERE YEAR(date) = ? AND MONTH(date) BETWEEN ? AND ? AND type IS NULL or type NOT IN ('C1','C2')", [params[:year],params[:start],params[:end]])
    current_debits = Invoice.all("WHERE YEAR(date) = ? AND MONTH(date) BETWEEN ? AND ? AND type IN ('C1','C2')", [params[:year],params[:start],params[:end]])
    render("index.ecr")
  end
end
