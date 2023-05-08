view: training_data {
  sql_table_name: `retail_banking.training_data`
    ;;

  dimension: card_transactions_amount {
    type: number
    sql: ${TABLE}.card_transactions_amount ;;
  }

  dimension: card_transactions_transaction_distance {
    type: number
    sql: ${TABLE}.card_transactions_transaction_distance ;;
  }

  dimension: card_transactions_transaction_hour_of_day {
    type: number
    sql: ${TABLE}.card_transactions_transaction_hour_of_day ;;
  }

  dimension: is_fraud {
    type: yesno
    sql: ${TABLE}.is_fraud ;;
  }

  dimension: trans_id {
    type: string
    sql: ${TABLE}.trans_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
