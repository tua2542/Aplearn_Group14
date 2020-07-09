import 'package:aplearn_group14/src/Presenters/vote_service.dart';
import 'package:aplearn_group14/src/Views/state/vote_state.dart';
import 'package:aplearn_group14/src/Views/vote/vote_result.dart';
import 'package:aplearn_group14/src/Views/vote/vote_widgets/vote.dart';
import 'package:aplearn_group14/src/Views/vote/vote_widgets/vote_list.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class VoteScreen extends StatefulWidget {
  @override
  _VoteScreenState createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    // loading votes
    Future.microtask(() {
      Provider.of<VoteState>(context, listen: false).loadVoteList(context);
      Provider.of<VoteState>(context, listen: false).clearState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VoteState()),
      ],
      child: Consumer<VoteState>(builder: (builder, voteState, child) {
        return Container(
          child: Column(
            children: <Widget>[
              if (voteState.voteList == null)
                Container(
                  color: Colors.lightBlue,
                  child: Center(
                    child:
                        Loading(indicator: BallPulseIndicator(), size: 100.0),
                  ),
                ),
              if (voteState.voteList != null)
                Expanded(
                  child: Stepper(
                    type: StepperType.horizontal,
                    currentStep: _currentStep,
                    steps: [
                      getStep(
                        title: 'Choose',
                        child: VoteListWidget(),
                        isActive: true,
                      ),
                      getStep(
                        title: 'Vote',
                        child: VoteWidget(),
                        isActive: _currentStep >= 1 ? true : false,
                      ),
                    ],
                    onStepCancel: () {
                      if (_currentStep <= 0) {
                        voteState.activeVote = null;
                      } else if (_currentStep <= 1) {
                        voteState.selectedOptionInActiveVote = null;
                      }

                      setState(() {
                        _currentStep =
                            (_currentStep - 1) < 0 ? 0 : _currentStep - 1;
                      });
                    },
                    onStepContinue: () {
                      if (_currentStep == 0) {
                        if (step2Required(voteState)) {
                          setState(() {
                            _currentStep =
                                (_currentStep + 1) > 2 ? 2 : _currentStep + 1;
                          });
                        } else {
                          showSnackBar(context, 'Please select a vote first!');
                        }
                      } else if (_currentStep == 1) {
                        if (step3Required(voteState)) {
                          // submit vote
                          markMyVote(voteState);

                          // Go To Result Screen
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen()));
                        } else {
                          showSnackBar(context, 'Please mark your vote!');
                        }
                      }
                    },
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }

  bool step2Required(VoteState voteState) {
    if (voteState.activeVote == null) {
      return false;
    }

    return true;
  }

  bool step3Required(VoteState voteState) {
    if (voteState.selectedOptionInActiveVote == null) {
      return false;
    }
    return true;
  }

  void showSnackBar(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(fontSize: 22),
      ),
    ));
  }

  Step getStep({
    String title,
    Widget child,
    bool isActive = false,
  }) {
    return Step(
      title: Text(title),
      content: child,
      isActive: isActive,
    );
  }

  void markMyVote(VoteState voteState) {
    final voteId = voteState.activeVote.voteId;
    final option = voteState.selectedOptionInActiveVote;

    markVote(voteId, option);
  }
}

mixin voteState {}
