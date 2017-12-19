import React from "react"
import ReactDOM from 'react-dom'
import PropTypes from "prop-types"
import 'src/bracket'
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
          // console.log(whole_round)
          console.log(index)

          let closing_li; 
          let contestant_2;
          let spacer_game;
          const contestant_2_name = this.state.data[round][index]['contestant_2'] 
          const contestant_1_name = this.state.data[round][index]['contestant_1'] 

          if (whole_round.length - 1 === index) { 
              closing_li = (<li className="spacer">&nbsp;</li>);
            }

          if (Object.keys(this.state.data[round][0]).length > 5) {
            // console.log('last')
            contestant_2 = (
              <li className="game game-bottom "><a href="" onClick={(event)=>{this.setPopup(event)}}>{ contestant_2_name || " "}</a><span></span></li>);
            spacer_game = (<li className="game game-spacer">&nbsp;</li>);
          }

            let output = (
              <div className="match-div"key={match}>
                <li className="spacer">&nbsp;</li>
                <li className="game game-top"><a href="" onClick={(event)=>{this.setPopup(event)}}>{contestant_1_name || " "}</a><span></span></li>
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

  setPopup(event) {
    console.log('fadsfadsfasdfsdf')
    this.setState({popup: true})
    event.preventDefault()
  }


  render () {
    // console.log(this.state.data)
    const test = this.createRound();
    let popup;
    if (this.state.popup === true) {
      popup = <MatchDisplay popup_state={()=>{this.setState({popup: !this.state.popup})}} popup_date={this.state.popup_data}/>
    }
    return (
        <div className="bracket">
          {test}
          {popup}
        </div>
    );
  }
}

bracket.propTypes = {
  game: PropTypes.object
};

export default bracket
