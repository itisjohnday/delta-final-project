import React from "react"
import ReactDOM from 'react-dom'
import PropTypes from "prop-types"
import 'src/score_board'


class TableDisplay extends React.Component {

  constructor(props) {
   super(props)
   this.state = {
   // array with names and points
    petArray: [ {name:"Billy" ,points: 90} , {name:"John", points:50} ,{name: "Deja", points: 200},{name: "Deja", points: 200},{name: "Dej", points: 200},{name: "Da", points: 200}, {name: "D", points: 200}, {name: "Deja", points: 200}, {name: "Deja", points: 200},{name: "Deja", points: 200},{name: "Deja", points: 200},{name: "Deja", points: 200},{name: "Deja", points: 200},{name: "Deja", points: 200},{name: "Deja", points: 200},{name: "Deja", points: 200},{name: "Deja", points: 200},{name: "Deja", points: 200},{name: "Deja", points: 200}],
    petArrayReal: []

   }
 }

getScores() {
  console.log('fetching')
fetch(`/current_scores/${this.props.tournament_id}`, {
  headers: {
    'Content-Type': 'application/json',
  },
  method: 'get'
}).then((response) => {
  return response.json();
}).then((json) => {
  this.setState({petArrayReal: json})
  console.log(json)
})
}

componentDidMount() {
        var timer = setInterval(this.getScores.bind(this), 5000);
        // console.log(timer);
}

 renderPet(pet, index) {
   return (
     <tr key={index}>
       <td><a href="#">{pet.name}</a></td>
       <td>{pet.points}</td>
     </tr>
   )
 }


  render () {

    // setTimeout(this.getScores, 3000);
    return (
      <div className="table_display" >

        <table className="striped condensed hover">
          <thead>
            <tr>
              <th>Pet Name</th>
              <th>Points</th>
            </tr>
          </thead>
          <tbody>
            {this.state.petArrayReal.map(this.renderPet)}
          </tbody>
        </table>

      </div>

    );
  }
}


export default TableDisplay
