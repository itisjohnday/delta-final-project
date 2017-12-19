import React from "react"
import ReactDOM from 'react-dom'
import PropTypes from "prop-types"
import 'css/bracket.css'
import MatchDisplay from 'match_display'

class bracket extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      rounds: 4,
      sample: {'round-1': {match1: [{name: 'fluffy'},{name: 'sharky'}], match2: [{name: 'snarles'},{name: 'gruff'}], match3: [{name: 'fluffy'},{name: 'sharky'}], match4: [{name: 'snarles'},{name: 'gruff'}]}, 'round-2': {match1: [{name:'fluffy'},{name:'gruff'}],match2: [{name:'fluffy'},{name:'gruff'}]}, 'round-3': {match1: [{name:'fluffy'},{name:'gruff'}]}, 'round-4': {match1: [{name:'fluffy'}]}},
      data: this.props.game,
      popup: false,
      popup_data: []
    }

  }

  createRound() {
    // for (let i = 1; i <= this.state.rounds; i++) {

    // }
  // console.log(Object.keys(this.state.sample)) 
    var output =Object.keys(this.state.data).map((round, index, array) => {
        // console.log(round)
        const output = (
        <ul className="round"key={round}>
          {this.createMatch(round)}
        </ul>
        )
        // console.log(output);
        return output;
    });

    return output
  }

  createMatch(round) {
    return Object.keys(this.state.data[round]).map((match, index, whole_round)=>{
          // console.log(this.state.sample[round][match])    
          console.log(whole_round)
          console.log(index)

          let closing_li; 
          let contestant_2;
          let spacer_game; 


          if (whole_round.length - 1 === index) { 
              closing_li = (<li className="spacer">&nbsp;</li>);
            }

          if (Object.keys(this.state.data[round][0]).length > 5) {
            // console.log('last')
            contestant_2 = (
              <li className="game game-bottom ">{this.state.data[round][index]['contestant_2'] || " "}<span></span></li>);
            spacer_game = (<li className="game game-spacer">&nbsp;</li>);
          }

            let output = (
              <div className="match-div"key={match}>
                <li className="spacer">&nbsp;</li>
                <li className="game game-top">{this.state.data[round][index]['contestant_1'] || " "}<span></span></li>
                {spacer_game}
                {contestant_2}
                {closing_li}
              </div>
            )
            // console.log(output)
            
            return output;
        });
  }

  populateBracket() {

  }

  getWinners() {

  }


  render () {
    console.log(this.state.data)
    const test = this.createRound();
    return (
      <div className="bracket">
        {test}
        
        
      </div>
    );
  }
}

bracket.propTypes = {
  game: PropTypes.object
};

export default bracket
