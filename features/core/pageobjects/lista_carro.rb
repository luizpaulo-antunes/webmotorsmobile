class ListaCarro
  include RSpec::Matchers

  def initialize
    get_screen_mappings 'carros', 'core'
  end

  def topo
    element_exists? @mappings['topo']
  end

  def lista
    fill_in @mappings['corpo']
  end

  def selecao
    click @mappings['opcao']
  end

  def valor
    element_exists? @mappings['valor']
  end

  def model
    element_exists? @mappings['modelo']
  end 

  def ano
    element_exists? @mappings['ano']
  end 

end
