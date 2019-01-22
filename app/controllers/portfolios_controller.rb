class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]

  def index
    @portfolio_items = Portfolio.all
    @page_title = "John Gates | Portfolio"
  end


  def show
    @page_title = "John Gates | " + @portfolio_item.title
    @seo_keywords = @portfolio_item.body
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.techniques.build }
  end

  
  def edit
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_item_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio Item was successfully created.' }
      else
        format.html { render :new }

      end
    end
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_item_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio Item was successfully Deleted.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_item
      @portfolio_item = Portfolio.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_item_params
      params.require(:portfolio).permit(:title,
										                    :subtitle, 
										                    :body,
                                        :large_img, 
                                        :thumb_img,
                                        techniques_attributes: [:name]

                                        )
										
    end
end