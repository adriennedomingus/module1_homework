var Body = React.createClass({
  getInitialState() {
    return { skills: [] }
  },
  componentDidMount() {
    $.getJSON('/api/v1/skills.json', (response) => { this.setState({ skills: response }) });
  },
  handleSubmit(skill) {
    var newState = this.state.skills.concat(skill);
    this.setState({ skills: newState })
  },
  handleDelete(id) {
    $.ajax({
      url: '/api/v1/skills/' + id,
      type: 'DELETE',
      success: () => {
        this.removeSkillFromDOM(id);
      }
    })
  },
  onUpdate() {
    if (this.state.editable) {
      var name = this.refs.name.value;
      var details = this.refs.details.value;
      var skill = {name: name, details: details }

      this.props.handleUpdate(skill);
    }
    this.setState({editable: !this.state.editable })
  },
  handleUpdate(skill) {
    console.log(skill, 'in handleUpdate')
  },

  removeSkillFromDOM(id) {
    var newSkills = this.state.skills.filter((skill) => {
      return skill.id != id
    });
    this.setState({ skills: newSkills })
  },
  render() {
    return (
      <div>
        <NewSkill handleSubmit={this.handleSubmit} />
        <AllSkills skills={this.state.skills} handleDelete={this.handleDelete}/>
      </div>
    )
  }
})
