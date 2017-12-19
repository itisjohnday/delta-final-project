import React from "react"
import ReactDOM from 'react-dom'
import PropTypes from "prop-types"
import puppy1 from './images/puppy1.jpeg';
import puppy2 from './images/puppy2.jpg';
import 'src/match_frame'

class MatchDisplay extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      contestant_1: this.props.popup_data['contestant_1'],
      contestant_1_entry_id: this.props.popup_data['contestant_1_entry_id'],
      contestant_1_entry_pic: this.props.popup_data['contestant_1_entry_pic'],
      contestant_1_prof_pic: this.props.popup_data['contestant_1_prof_pic'],      
      contestant_2: this.props.popup_data['contestant_2'],
      contestant_2_entry_id: this.props.popup_data['contestant_2_entry_id'],
      contestant_2_entry_pic: this.props.popup_data['contestant_2_entry_pic'],
      contestant_2_prof_pic: this.props.popup_data['contestant_2_prof_pic']
    };
  }

  sendResult(entry_id, pts) {
  // console.log(JSON.stringify({entry: this.state.links[0].entry_id, vote: pts}))
  fetch('http://localhost:3000/vote_reg', {
    method: 'POST',
    credentials: 'include',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-TOKEN': this.props.auth_token
    },
    body: JSON.stringify({entry: entry_id, vote: pts})
  }).then((response) => {
    console.log(response);
  })

  }

  vote(event, entry_id){
    event.preventDefault()
    // console.log(this.props.auth_token)
    this.sendResult(entry_id, 1)
    this.props.popup_state()
    
  }

  render () {
    
    // console.log(this.props.popup_data['contestant_1_prof_pic: '])
    return (
      <div className="match">

      <h4 className ="header_vote"> Click to vote on the best!  </h4> 
        <div className="grid-container">
          <div className="one"> 
            <p className="puppyname1"> 
              <strong> {this.state.contestant_1} </strong> 
            </p> 
            <img src={this.state.contestant_1_entry_pic} className="puppy1" alt="" /> 
            <p className="vote1"> 
              <strong> <a href="url" onClick={(e)=>{this.vote(e, this.state.contestant_1_entry_id)}}>vote</a> </strong> 
            </p> 
          </div>
          <div className="two"> 
            <strong> <p className="vs" > VS </p> </strong> 
          </div>
          <div className="three"> 
            <p className="vote1"> 
              <strong> <a href="url" onClick={(e)=>{this.vote(e, this.state.contestant_1_entry_id)}}>vote</a> </strong> 
            </p> 
            <img src={this.state.contestant_2_entry_pic} className="puppy2"  alt="" /> 
            <p className="puppyname2"> 
              <strong> {this.state.contestant_2} </strong> 
            </p>
          </div>
        </div>

      </div>
    );
  }
}


export default MatchDisplay
