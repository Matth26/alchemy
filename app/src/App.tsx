import { useEffect } from 'react';
import './App.css';
import { useDojo } from './DojoContext';

function App() {
  const {
    setup: {
      systemCalls: { init_user },
      components: { Elements },
      network: { graphSdk },
    },
    account: { create, list, select, account, isDeploying },
  } = useDojo();

  // entity id - this example uses the account address as the entity id
  const entityId = account.address;

  // get current component values
  /*const position = useComponentValue(
    Position,
    parseInt(entityId.toString()) as EntityIndex
  );
  const moves = useComponentValue(
    Moves,
    parseInt(entityId.toString()) as EntityIndex
  );*/

  useEffect(() => {
    if (!entityId) return;

    const fetchData = async () => {
      const { data } = await graphSdk.getEntities();
      console.log('entities', data);

      if (data) {
        /*let remaining = getFirstComponentByType(
          data.entities?.edges,
          'Moves'
        ) as Moves;
        let position = getFirstComponentByType(
          data.entities?.edges,
          'Position'
        ) as Position;

        setComponent(Moves, parseInt(entityId.toString()) as EntityIndex, {
          remaining: remaining.remaining,
        });
        setComponent(Position, parseInt(entityId.toString()) as EntityIndex, {
          x: position.x,
          y: position.y,
        });*/
      }
    };

    fetchData();
  }, [account.address]);

  return (
    <>
      <button onClick={create}>
        {isDeploying ? 'deploying burner' : 'create burner'}
      </button>
      <div className="card">
        select signer:{' '}
        <select onChange={(e) => select(e.target.value)}>
          {list().map((account, index) => {
            return (
              <option value={account.address} key={index}>
                {account.address}
              </option>
            );
          })}
        </select>
      </div>

      <div className="card">
        <button onClick={() => init_user(account)}>Init Player</button>
      </div>
      {/*<div className="card">
        <div>
          Moves Left: {moves ? `${moves['remaining']}` : 'Need to Spawn'}
        </div>
      </div>
      <div className="card">
        <div>
          Position:{' '}
          {position ? `${position['x']}, ${position['y']}` : 'Need to Spawn'}
        </div>
      </div>*/}
    </>
  );
}

export default App;
