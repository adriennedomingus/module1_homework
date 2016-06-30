var AllSkills = React.createClass({
  onUpdate(skill) {
    this.props.handleUpdate(skill);
  },
  render() {
    var skills = this.props.skills.map((skill) => {
      return (
        <div key={skill.id}>
          <Skill skill={skill}
            handleDelete={this.props.handleDelete.bind(this, skill.id)}/>
        </div>
      )
    });
    return (
      <div>
        {skills}
      </div>
    )
  }
})
