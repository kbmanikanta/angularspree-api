object false
if request.headers['ng-api'] == 'true'
  extends 'spree/api/v1/orders/ng_index'
else
  child(@orders => :orders) do
    extends 'spree/api/v1/orders/order'
  end
  node(:count) { @orders.count }
  node(:current_page) { params[:page].try(:to_i) || 1 }
  node(:pages) { @orders.total_pages }
  node(:per_page) { params[:per_page].try(:to_i) || Kaminari.config.default_per_page }
  node(:total_count) {@orders.total_count}
end
