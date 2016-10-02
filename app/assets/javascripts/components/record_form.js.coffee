@RecordForm = React.createClass
	getInitialState: ->
		title: ''
		date: ''
		amount: ''

	valid: ->
		@state.title && @state.date && @state.amount 

	handleChange: (event) ->
		name = event.target.name
		@setState "#{ name }": event.target.value

	handleSubmit: (event) ->
		event.preventDefault()
		$.post '', { record: @state }, (data) =>
			@props.handleNewRecord data
			@setState @getInitialState(),
			'JSON'

	render: ->
		React.DOM.form
			className: 'form-inline'
			onSubmit: @handleSubmit
	render: ->
		React.DOM.form
			className: 'form-group'
			React.DOM.input
				type: 'text'
				className: 'form-control'
				placeholder: 'Date'
				name: 'date'
				value: @state.date
				onChange: @handleChange
			React.DOM.div
				className: 'form-group'
				React.DOM.input
					type: 'text'
					className: 'form-control'
					placeholder: 'Title'
					name: 'title'
					value: @state.title
					onChange: @handleChange
				React.DOM.div
					className: 'form-group'
					React.DOM.input
						type: 'number'
						className: 'form-control'
						placeholder: 'Amount'
						name: 'amount'
						value: @state.amount
						onChange: @handleChange
					React.DOM.button
						type: 'submit'
						className: 'btn btn-info'
						disabled: !@valid()
						'Create record'