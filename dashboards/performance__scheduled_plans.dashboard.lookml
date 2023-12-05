- dashboard: performance__scheduled_plans
  title: Performance - Scheduled Plans
  layout: newspaper
  preferred_viewer: dashboards-next
  description: 'Helps to identify long running schedules'
  filters_bar_collapsed: true
  elements:
  - title: Performance - Scheduled Plans
    name: Performance - Scheduled Plans
    model: system__activity
    explore: scheduled_plan
    type: looker_timeline
    fields: [scheduled_plan.id, scheduled_plan.content_type_id, scheduled_plan.name,
      scheduled_job.status, scheduled_job.status_detail, scheduled_plan.user_id, scheduled_plan.cron_schedule,
      scheduled_plan.datagroup, created_seconds, finalized_seconds, scheduled_job_stage.runtime,
      scheduled_plan_destination.address, scheduled_plan_destination.format, scheduled_plan_destination.type]
    filters:
      scheduled_job_stage.runtime: ">0"
    sorts: [scheduled_job_stage.runtime desc]
    limit: 5000
    column_limit: 50
    dynamic_fields: [{category: dimension, expression: 'extract_minutes(${scheduled_job.created_time})*60+extract_seconds(${scheduled_job.created_time})',
        label: Created - seconds, value_format: !!null '', value_format_name: !!null '',
        dimension: created_seconds, _kind_hint: dimension, _type_hint: number}, {
        category: dimension, expression: 'extract_minutes(${scheduled_job.finalized_time})*60+extract_seconds(${scheduled_job.finalized_time})',
        label: Finalized - seconds, value_format: !!null '', value_format_name: !!null '',
        dimension: finalized_seconds, _kind_hint: dimension, _type_hint: number}]
    query_timezone: user_timezone
    groupBars: true
    labelSize: 10pt
    showLegend: true
    color_application:
      collection_id: dv-palette
      custom:
        id: ceba7cfe-b4f8-341c-8257-97f0d15ebbd8
        label: Custom
        type: continuous
        stops:
        - color: orange
          offset: 0
        - color: blue
          offset: 100
      options:
        steps: 5
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      scheduled_job.count:
        is_active: true
    defaults_version: 1
    hidden_fields: [scheduled_job.status, scheduled_job.status_detail, scheduled_plan.cron_schedule,
      scheduled_plan.datagroup, scheduled_plan.content_type_id, scheduled_plan_destination.address,
      scheduled_plan_destination.format, scheduled_plan_destination.type, scheduled_plan.user_id]
    series_types: {}
    hidden_pivots: {}
    listen:
      Send All Results (Yes / No): scheduled_plan.send_all_results
      Created Date: scheduled_job.created_date
      External ID: user_facts.external_id
      User ID: user_facts.user_id
      Status: scheduled_job.status
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: system__activity
    explore: scheduled_plan
    listens_to_filters: []
    field: scheduled_job.created_date
  - name: User ID
    title: User ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: system__activity
    explore: scheduled_plan
    listens_to_filters: []
    field: user_facts.user_id
  - name: External ID
    title: External ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: scheduled_plan
    listens_to_filters: []
    field: user_facts.external_id
  - name: Status
    title: Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: system__activity
    explore: scheduled_plan
    listens_to_filters: []
    field: scheduled_job.status
  - name: Send All Results (Yes / No)
    title: Send All Results (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: system__activity
    explore: scheduled_plan
    listens_to_filters: []
    field: scheduled_plan.send_all_results
