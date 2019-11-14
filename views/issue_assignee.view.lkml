include: "//@{CONFIG_PROJECT_NAME}/github_commits.view"

view: issue_assignee {
  extends: [issue_assignee_config]
}

view: issue_assignee_core {
  sql_table_name: @{GITHUB_SCHEMA}.issue_assignee ;;

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.issue_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [issue.id]
  }
}