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
      data: this.props.game,
      popup: false,
      popup_data: {},
      token: this.props.auth
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
          // console.log(index)

          let closing_li; 
          let contestant_2;
          let spacer_game;
          const contestant_2_name = this.state.data[round][index]['contestant_2'] 
          const contestant_1_name = this.state.data[round][index]['contestant_1'] 
          const popup_data = this.state.data[round][index]

          if (whole_round.length - 1 === index) { 
              closing_li = (<li className="spacer">&nbsp;</li>);
            }

          if (Object.keys(this.state.data[round][0]).length > 5) {
            // console.log('last')
            contestant_2 = (
              <li className="game game-bottom "><a href="" onClick={(event)=>{this.setPopup(event, popup_data)}}>{ contestant_2_name || " "}</a><span></span></li>);
            spacer_game = (<li className="game game-spacer">&nbsp;</li>);
          }

            let output = (
              <div className="match-div"key={match}>
                <li className="spacer">&nbsp;</li>
                <li className="game game-top"><a href="" onClick={(event)=>{this.setPopup(event, popup_data)}}>{contestant_1_name || " "}</a><span></span></li>
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

  setPopup(event, popup_data) {
    // console.log('fadsfadsfasdfsdf')
    this.setState({popup: true, popup_data: popup_data})
    // console.log(popup_data)
    event.preventDefault()
  }


  render () {
    // console.log(this.state.data)
    const test = this.createRound();
    let popup;
    if (this.state.popup === true) {
      popup = <MatchDisplay popup_state={()=>{this.setState({popup: !this.state.popup})}} popup_data={this.state.popup_data} auth_token={this.state.token}/>
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
  game: PropTypes.object,
  auth: PropTypes.string
};

export default bracket
