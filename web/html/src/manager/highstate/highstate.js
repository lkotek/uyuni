/* eslint-disable */
'use strict';

const React = require("react");
const ReactDOM = require("react-dom");
const {DisplayHighstate} = require("./display-highstate");
const Messages = require("components/messages").Messages;
const MessagesUtils = require("components/messages").Utils;
const {ActionSchedule} = require("components/action-schedule");
const AsyncButton = require("components/buttons").AsyncButton;
const {Toggler} = require("components/toggler");
const Network = require("utils/network");
const { InnerPanel } = require('components/panels/InnerPanel');
const Functions = require("utils/functions");
const Formats = Functions.Formats;
const {ActionLink, ActionChainLink} = require("components/links");
const SpaRenderer  = require("core/spa/spa-renderer").default;

const messagesCounterLimit = 3;

function msg(severityIn, textIn) {
    return {severity: severityIn, text: textIn};
}

class Highstate extends React.Component {
    constructor(props) {
        super(props);
        var state = {
            messages: [],
            earliest: Functions.Utils.dateWithTimezone(localTime),
            test: false
        };
        this.state = state;
    }

    applyHighstate = () => {
        const request = Network.post(
            "/rhn/manager/api/states/applyall",
            JSON.stringify({
                ids: minions.map(m => m.id),
                earliest: Formats.LocalDateTime(this.state.earliest),
                actionChain: this.state.actionChain ? this.state.actionChain.text : null,
                test: this.state.test
            }),
            "application/json"
        ).promise.then(data => {
            const msg = MessagesUtils.info(this.state.actionChain ?
                    <span>{t("Action has been successfully added to the ")}<ActionChainLink id={data}>{this.state.actionChain ? this.state.actionChain.text : ""}</ActionChainLink></span> :
                    <span>{t("Applying the highstate has been ")}<ActionLink id={data}>{t("scheduled.")}</ActionLink></span>);

            const msgs = this.state.messages.concat(msg);

            // Do not spam UI showing old messages
            while (msgs.length > messagesCounterLimit) {
              msgs.shift();
            }

            this.setState({
                messages: msgs
            });
        }).catch(this.handleResponseError);

        return request;
    };

    handleResponseError = (jqXHR) => {
      this.setState({
           messages: Network.responseErrorMessage(jqXHR)
      });
    };

    onDateTimeChanged = (date) => {
        this.setState({"earliest": date});
    };

    onActionChainChanged = (actionChain) => {
        this.setState({actionChain: actionChain})
    };

    toggleTestState = () => {
        this.setState({test: !this.state.test})
    };

    };

    render() {
        const messages = this.state.messages.length > 0 ? <Messages items={this.state.messages}/> : null;
        const buttons = [
            <div className="btn-group pull-right">
              <Toggler text={t('Test mode')} value={this.state.test} className="btn" handler={this.toggleTestState.bind(this)} />
              <AsyncButton action={this.applyHighstate} defaultType="btn-success" text={t("Apply Highstate")} disabled={minions.length === 0} />
            </div>
            ];
        const showHighstate = [
            <InnerPanel title={t("Highstate")} icon="spacewalk-icon-salt" buttons={buttons} buttonsLeft={this.isSSM() ? undefined : buttonsLeft}>
                <div className="panel panel-default">
                    <div className="panel-heading">
                        <div>
                            <h3>Apply Highstate</h3>
                        </div>
                    </div>
                    <div className="panel-body">
                        <ActionSchedule timezone={timezone} localTime={localTime}
                                        earliest={this.state.earliest}
                                        actionChains={actionChains}
                                        actionChain={this.state.actionChain}
                                        onActionChainChanged={this.onActionChainChanged}
                                        onDateTimeChanged={this.onDateTimeChanged}/>
                    </div>
                </div>
                <DisplayHighstate />
            </InnerPanel>
        ];
        return (
            <div>
                {messages}
                <InnerPanel title={t("Highstate")} icon="spacewalk-icon-salt" buttons={buttons} >

                <ActionSchedule timezone={timezone} localTime={localTime}
                   earliest={this.state.earliest}
                   actionChains={actionChains}
                   actionChain={this.state.actionChain}
                   onActionChainChanged={this.onActionChainChanged}
                   onDateTimeChanged={this.onDateTimeChanged}/>

                    showHighstate
                }
              </InnerPanel>
            </div>
        );
    }
}

export const renderer = () => SpaRenderer.renderNavigationReact(
    <Highstate />,
    document.getElementById('highstate')
);
