- dashboard: performance_scheduled_plans
  title: "[Performance] Scheduled Plans"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: 'Helps to evaluate the release from query performance perspective'
  filters_bar_collapsed: true
  elements:
  - title: "[Performance] Scheduled Plans"
    name: "[Performance] Scheduled Plans"
    model: system__activity
    explore: scheduled_plan
    type: looker_timeline
    fields: [scheduled_plan.id, scheduled_plan.content_type_id, scheduled_plan.name,
      scheduled_job.status, scheduled_job.status_detail, scheduled_plan.user_id, scheduled_plan.cron_schedule,
      scheduled_plan.datagroup, scheduled_job.created_time, scheduled_job.finalized_time,
      created_time, finalized_time, scheduled_job_stage.runtime, scheduled_plan_destination.address,
      scheduled_plan_destination.format, scheduled_plan_destination.type]
    filters:
      scheduled_job_stage.runtime: ">0"
    sorts: [scheduled_job_stage.runtime desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: extract_minutes(${scheduled_job.created_time})*60+extract_seconds(${scheduled_job.created_time})
      label: Created Time
      value_format:
      value_format_name:
      dimension: created_time
      _kind_hint: dimension
      _type_hint: number
    - category: dimension
      expression: extract_minutes(${scheduled_job.finalized_time})*60+extract_seconds(${scheduled_job.finalized_time})
      label: Finalized Time
      value_format:
      value_format_name:
      dimension: finalized_time
      _kind_hint: dimension
      _type_hint: number
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
      scheduled_plan_destination.format, scheduled_plan_destination.type, scheduled_plan.user_id,
      scheduled_job.finalized_time, scheduled_job.created_time]
    hidden_pivots: {}
    title_hidden: true
    listen:
      Send All Results (Yes / No): scheduled_plan.send_all_results
      Created Date: scheduled_job.created_date
      User Name: user.name
      Schedule Status: scheduled_job.status
    row: 3
    col: 0
    width: 24
    height: 10
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"How to use:","bold":true}],"id":1701905409473},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"This
      dashboard is designed to show intersections between executed schedules during
      the day"}],"id":1680749533581}],"id":1680749551915},{"type":"li","children":[{"type":"lic","id":1701905438031,"children":[{"text":"Filters:
      Created Date for schedule (by default - 7 days), User Name, Schedule Status
      and Send All Results (Yes / No)"}]}],"id":1701905438032},{"type":"li","children":[{"type":"lic","children":[{"text":"Timeline
      chart shows runtime bars in seconds, grouped by Schedule Plan ID"}],"id":1701905542721}],"id":1701905542721},{"type":"li","children":[{"type":"lic","children":[{"text":"Legend
      shows Schedule Plan ID , Schedule Plan Name,  Started Time - End Time (Number
      of runs during Created Date Range)"}],"id":1701905786061}],"id":1701905786060},{"type":"li","children":[{"type":"lic","children":[{"text":"Data
      Section of the tile contains raw level details"}],"id":1701905905475}],"id":1701905905475}],"id":1701905409473}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 3
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
  - name: User Name
    title: User Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: scheduled_plan
    listens_to_filters: []
    field: user.name
  - name: Schedule Status
    title: Schedule Status
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
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
