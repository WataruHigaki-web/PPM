# frozen_string_literal: true

class ComboItem < ApplicationRecord
  belongs_to :combo
  belongs_to :product

  def on_sale_or_sold_out(product, combo)
    @re_q = OrderRecord.where(combo_id: combo.id, product_id: product.id, status: "予約受付中").sum(:quantity)
    @le_q = OrderRecord.where(combo_id: combo.id, product_id: product.id, status: "貸出中").sum(:quantity)
    @tur_q = OrderRecord.where(combo_id: combo.id, product_id: product.id, status: "郵送中").sum(:quantity)
    if product.stock - @re_q.to_i - @le_q.to_i - @tur_q.to_i == 0
      '売切'
    else
      '販売中'
    end
  end


  def reserve(product, combo)
    OrderRecord.where(combo_id: combo.id, product_id: product.id, status: "予約受付中").sum(:quantity)
  end

  def lending(product, combo)
    OrderRecord.where(combo_id: combo.id, product_id: product.id, status: "貸出中").sum(:quantity)
  end

  def return(product, combo)
    OrderRecord.where(combo_id: combo.id, product_id: product.id, status: "郵送中").sum(:quantity)
  end

  def combo_reserve(combo)
    OrderRecord.where(combo_id: combo.id, status: "予約受付中").sum(:quantity)
  end

  def combo_lending(combo)
    OrderRecord.where(combo_id: combo.id, status: "貸出中").sum(:quantity)
  end

  def combo_return(combo)
    OrderRecord.where(combo_id: combo.id, status: "郵送中").sum(:quantity)
  end
end
