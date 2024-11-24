module HomeHelper

  def area_inicial
    if current_user.cliente?
      render partial: "home/inicial_cliente"
    else
      render partial: "home/inicial_tecnico"
    end
  end
end
