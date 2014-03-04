class Panier
 attr_reader :selection
 def initialize
  @selection = []
 end
 def ajouter_au_panier(produit)
  @selection << produit
 end
 def vider()
  @selection = []
 end
end