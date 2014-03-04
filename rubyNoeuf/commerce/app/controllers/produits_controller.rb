class ProduitsController < ApplicationController
  before_action :set_produit, only: [:show, :edit, :update, :destroy]

  # GET /produits
  # GET /produits.json
  def index
    @produits = Produit.all
	#modification chap8
	if params[:mobile1] then
		   render  :layout => 'mobile', :template => 'mobile1/index.html.erb'
	end
	
	if params[:mobile2] then
		render   :layout => 'mobile', :template => 'mobile2/index.html.erb'
    end
	
	if params[:mobile3] then
		render   :layout => 'mobile', :template => 'mobile3/index.html.erb'
    end
  end

  # GET /produits/1
  # GET /produits/1.json
  def show
	if params[:mobile1] then
		   render  :layout => 'mobile', :template => 'mobile1/show.html.erb'
	end
  end

  # GET /produits/new
  def new
    @produit = Produit.new
  end

  # GET /produits/1/edit
  def edit
  end

  # POST /produits
  # POST /produits.json
  def create
    @produit = Produit.new(produit_params)

    respond_to do |format|
      if @produit.save
        #format.html { redirect_to @produit, notice: 'Produit was successfully created.' }
		format.html { redirect_to produits_url, notice: 'Produit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @produit }
      else
        format.html { render action: 'new' }
        format.json { render json: @produit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produits/1
  # PATCH/PUT /produits/1.json
  def update
    respond_to do |format|
      if @produit.update(produit_params)
        #format.html { redirect_to @produit, notice: 'Produit was successfully updated.' }
		format.html { redirect_to produits_url, notice: 'Produit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @produit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produits/1
  # DELETE /produits/1.json
  def destroy
    @produit.destroy
    respond_to do |format|
      format.html { redirect_to produits_url }
      format.json { head :no_content }
    end
  end

	
	def get_panier
        if session[:panier]
                return session[:panier]
        else
                session[:panier] = Panier.new
                return session[:panier]
        end
	end
	def ajouter_au_panier
		@panier=get_panier
		p 'xxxxx'
		p @panier
		selection=@panier.ajouter_au_panier(params[:id])
		@pp=Produit
	end
	
	def vider_panier
		@panier=get_panier
		@panier.vider
		respond_to do[format]
			format.html{redirect_to produit_url,notice:'Panier is empty.'}
			format.json{head:no_content}
		end
	end
	
	def index_panier
		@panier=get_panier
		@pp=produit
	end
  #private
    # Use callbacks to share common setup or constraints between actions.
    def set_produit
      @produit = Produit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produit_params
      params.require(:produit).permit(:nom, :description, :prix, :image)
    end

	end
