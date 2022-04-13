class ListaCarro
  include RSpec::Matchers

  def topo
    get_screen_mappings 'carro', 'core'
  end

  def lista
  fill_in @mappings['corpo']
  end

  def selecao
  fill_in @mappings['opcao']
  end

  def valor
    element_exists? @mappings['valor']
  end

  def model
    click @mappings['modelo']
  end 

  def ano
    click @mappings['ano']
  end 

end
