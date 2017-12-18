import React from "react"
import ReactDOM from 'react-dom'
import PropTypes from "prop-types"



class bracket extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      rounds: 4,
      sample: {'round-1': {match1: [{name: 'fluffy'},{name: 'sharky'}], match2: [{name: 'snarles'},{name: 'gruff'}]}, 'round-2': {match1: [{name:'fluffy'},{name:'gruff'}]}}
    }

  }

  createRound() {
    // for (let i = 1; i <= this.state.rounds; i++) {

    // }
  
    var output =Object.keys(this.state.sample).map((round) => {
        return(
        <ul className="round"key={round.toString()}>
          {this.createMatch(round)}
          <li className="spacer">&nbsp;</li>
        </ul>
        )
    });

    return output
  }

  createMatch(round) {
    return Object.keys(this.state.sample[round]).map((match)=>{
          // console.log(this.state.sample[round][match])
            return (
              <div key={match}>
                <li className="spacer">&nbsp;</li>
                <li className="game game-top">{this.state.sample[round][match][0]['name']}<span></span></li>
                <li className="game game-spacer">&nbsp;</li>
                <li className="game game-bottom ">{this.state.sample[round][match][1]['name']}<span></span></li>
              </div>
            )
        });
  }

  populateBracket() {

  }

  getWinners() {

  }


  render () {
    const sample = {match1: [{name: 'fluffy'},{name: 'sharky'}], match2: [{name: 'snarles'},{name: 'gruff'}]}
    const test = this.createRound();
    return (
      <div className="bracket">
        {test}

      </div>
    );
  }
}


export default bracket
