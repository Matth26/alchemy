import { Query, RPCProvider } from '@dojoengine/core';
import { GraphQLClient } from 'graphql-request';
import { Account, num } from 'starknet';
import { getSdk } from '../generated/graphql';
import { defineContractComponents } from './contractComponents';
import { world } from './world';

export const WORLD_ADDRESS =
  '0xb777447dde4b9d7723263055ef0ea85877f7a64ad620a993cfd39b44c30fa7';

export type SetupNetworkResult = Awaited<ReturnType<typeof setupNetwork>>;

export async function setupNetwork() {
  const client = new GraphQLClient('http://localhost:8080');

  const graphSdk = getSdk(client);

  const contractComponents = defineContractComponents(world);

  const provider = new RPCProvider(WORLD_ADDRESS);

  return {
    contractComponents,
    provider,
    execute: async (
      signer: Account,
      system: string,
      call_data: num.BigNumberish[]
    ) => provider.execute(signer, system, call_data),
    entity: async (component: string, query: Query) =>
      provider.entity(component, query),
    entities: async (component: string, partition: number) =>
      provider.entities(component, partition),
    world,
    graphSdk,
  };
}
