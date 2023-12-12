- dashboard: performance_find_good_example_for_troubleshooting
  title: '[Performance] Find good example for performance troubleshooting'
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Find good example for performance troubleshooting
    name: Find good example for performance troubleshooting
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.created_time, history.runtime, user.id, user.name, history.slug,
      date_range_selected, filter_date_start, filter_date_end]
    sorts: [history.runtime desc, dates_selected]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: diff_days(to_date(${filter_date_start}), to_date(${filter_date_end}))+1
      label: Dates Selected
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: dates_selected
      _type_hint: number
    - category: dimension
      expression: substring(${query.filters},position(${query.filters},"datetime_filter")+18,42)
      label: Date Range Selected
      value_format:
      value_format_name:
      dimension: date_range_selected
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: |-
        if(position(${date_range_selected}, "\",")>0,
          replace(substring(${date_range_selected}, position(${date_range_selected}, "to")+3, 16),"/","-"),
        replace(substring(${date_range_selected}, position(${date_range_selected}, "to")+3, 19),"/","-")
        )
      label: Filter Date End
      value_format:
      value_format_name:
      dimension: filter_date_end
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: replace(substring(${date_range_selected}, 0, abs(position(${date_range_selected},
        "to")-2)),"/","-")
      label: Filter Date Start
      value_format:
      value_format_name:
      dimension: filter_date_start
      _kind_hint: dimension
      _type_hint: string
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, custom: {
            id: f7285b52-6f64-f817-97d8-4c1f0f2ff5ef, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: yellow, offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [history.runtime]}]
    hidden_fields: [filter_date_end, date_range_selected]
    defaults_version: 1
    listen:
      Completed Date: history.completed_date
      Result Source: history.result_source
      Dashboard ID: history.real_dash_id
      Explore: query.view
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Completed Date
    title: Completed Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.completed_date
  - name: Dashboard ID
    title: Dashboard ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.real_dash_id
  - name: Result Source
    title: Result Source
    type: field_filter
    default_value: "-NULL"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.result_source
  - name: Explore
    title: Explore
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: query
    listens_to_filters: []
    field: query.view
