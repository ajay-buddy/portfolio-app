class PortfoliosController < ApplicationController
    def index
        @portfolio_items = Portfolio.all()
    end

    def show
      @portfolio_items = Portfolio.friendly.find(params[:id])
    end

    def new
        @portfolio_items = Portfolio.new
    end

    def create
        @portfolio_items = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
    
        respond_to do |format|
          if @portfolio_items.save
            format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
            format.json { render :show, status: :created, location: @blog }
          else
            format.html { render :new }
            format.json { render json: @blog.errors, status: :unprocessable_entity }
          end
        end
      end

      def edit
        @portfolio_items = Portfolio.friendly.find(params[:id])
      end

      def update
        @portfolio_items = Portfolio.friendly.find(params[:id])
        respond_to do |format|
          if @portfolio_items.update(params.require(:portfolio).permit(:title, :subtitle, :body))
            format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
          else
            format.html { render :edit }
          end
        end
      end

      def destroy
        @portfolio_items = Portfolio.friendly.find(params[:id])

        @portfolio_items.destroy
        respond_to do |format|
          format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
end
