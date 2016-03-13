class ReportSwitcher
  constructor: (args) ->
    @$switcher = args['switcher']
    @$switcherValue = args['value']
    @bind()

  bind: ->
    @initializeSwitcher()
    @updateReportStatus()

  initializeSwitcher: ->
    @$switcher.bootstrapSwitch({
      onColor: 'misingo'
      onText: 'Sí'
      offText: 'No'
    })

  updateReportStatus: ->
    @$switcher.on 'switchChange.bootstrapSwitch', (event, state) ->
      $.ajax({
        url: $(this).data('url')
        method: 'put'
        data: {
          lost_report: {
            found: state
          }
        }
      })

$ ->
  window.reportSwitcher = new ReportSwitcher(
    switcher: $('.js--visibleReport')
  )
