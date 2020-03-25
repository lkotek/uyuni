// @flow
import type { ActionChain } from 'components/action-schedule';

import * as React from 'react';
import { TopPanel } from 'components/panels/TopPanel';
import { Loading } from 'components/utils/Loading';
import { VirtualizationPoolsActionApi } from '../virtualization-pools-action-api';
import { VirtualizationPoolDefinitionApi } from '../virtualization-pool-definition-api';
import { PoolProperties } from '../pool-properties';

type Props = {
  serverId: string,
  poolName: string,
  localTime: string,
  timezone: string,
  actionChains: Array<ActionChain>,
};

export function PoolsEdit(props: Props) {
  return (
    <VirtualizationPoolsActionApi
      hostid={props.serverId}
      bounce={`/rhn/manager/systems/details/virtualization/storage/${props.serverId}`}
    >
    {
      ({
        onAction,
        messages: actionMessages
      }) => (
        <VirtualizationPoolDefinitionApi
          hostid={props.serverId}
          poolName={props.poolName}
        >
        {
          ({
            definition,
            messages: definitionMessages,
          }) => {
            if (definition == null) {
              return <Loading />;
            }

            const onSubmit = (model: Object) => onAction('edit', [model.name], model);

            return (
              <TopPanel
                title={props.poolName}
              >
                <PoolProperties
                  serverId={props.serverId}
                  submitText={t('Update')}
                  submit={onSubmit}
                  initialModel={definition}
                  messages={actionMessages.concat(definitionMessages)}
                  timezone={props.timezone}
                  localTime={props.localTime}
                  actionChains={props.actionChains}
                />
              </TopPanel>
            );
          }
        }
        </VirtualizationPoolDefinitionApi>
      )
    }
    </VirtualizationPoolsActionApi>
  );
}

