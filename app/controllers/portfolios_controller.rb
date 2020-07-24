class PortfoliosController < ApplicationController
  layout "portfolios"
    def index
        # @portfolio_items = Portfolio.angular
        # @portfolio_items = Portfolio.angular_portfolio_items
        @portfolio_items = Portfolio.all
    end

    def show
      @portfolio_items = Portfolio.friendly.find(params[:id])
    end

    def new
        @portfolio_items = Portfolio.new
        3.times do
          @portfolio_items.technologies.build
        end
        # 3.times { @portfolio_items.technologies.build }
    end

    def create
        @portfolio_items = Portfolio.new(portfolio_params)
    
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
          if @portfolio_items.update(portfolio_params)
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

      private

      def portfolio_params
        params.require(:portfolio).permit(
          :title,
          :subtitle,
          :body,
          technologies_attributes: [:name]
        )
      end
end
