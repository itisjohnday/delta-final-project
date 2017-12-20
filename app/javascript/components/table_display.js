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
  console.log(fetching)
fetch('http://localhost:3000/get_links', {
  headers: {
    'Content-Type': 'application/json',
  },
  method: 'get'
}).then((response) => {
  return response.json();
}).then((json) => {
  this.setState({petArrayReal: json})
})
}

componentDidMount() {
        setTimeout(this.getScore, 3000);
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
            {this.state.petArray.map(this.renderPet)}
          </tbody>
        </table>

      </div>

    );
  }
}


export default TableDisplay
