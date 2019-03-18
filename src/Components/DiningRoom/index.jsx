import React from 'react';
import styled from 'styled-components';
import Button from '@material-ui/core/Button';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faHandPointLeft } from '@fortawesome/free-solid-svg-icons';
import Layout from '../Layout';
import MainSection from '../MainSection';
import Loader from '../Loader';
import getRoom from './getRoom';
import RoomDescription from './RoomDescription';
import MenuGroup from './MenuGroup';

const Container = styled.div`
    position: relative;
    min-height: calc(100vh - 64px);
    margin: 0 15px;
    display: flex;
    flex-direction: column;
    align-items: center;
`;

const BackButton = styled(Button)`
    && {
        align-self: flex-start;
        margin-bottom: 20px;
    }
`;

const BackIcon = styled(FontAwesomeIcon)`
    && {
        margin-right: 10px;
    }
`;


const ROOM_ACTIONS = {
    SET_LOADING: 0,
    SET_ROOM: 1,
}

const rooms = (state, action) => {
    switch (action.type) {
    case ROOM_ACTIONS.SET_LOADING:
        return {
            ...state,
            loading: action.loading,
        }
    case ROOM_ACTIONS.SET_ROOM:
        return {
            ...state,
            ...action.payload,
        }

    default:
        return state;
    }
}

const loadRoom = async (slug, dispatch) => {
    dispatch({
        type: ROOM_ACTIONS.SET_LOADING,
        loading: true,
    });

    const room = await getRoom(slug);

    dispatch({ 
        type: ROOM_ACTIONS.SET_ROOM, 
        payload: room
    });

    dispatch({ 
        type: ROOM_ACTIONS.SET_LOADING,
        loading: false
    });
}

const DiningRoom = ({ match }) => {
    const [room, dispatch] = React.useReducer(
        rooms,
        {
            loading: true,
            menuGroups: [],
        }
    );

    const { diningRoomSlug } = match.params;

    React.useEffect(() => {
        loadRoom(diningRoomSlug, dispatch);
    }, [])

    return (
        <Layout>
            <MainSection>
                <Container>
                    <Loader fullscreen loading={room.loading} />
                    <BackButton>
                        <BackIcon icon={faHandPointLeft} />
                        К списку столовых
                    </BackButton>
                    <RoomDescription {...room} />
                    {room.menuGroups.map((menuGroup) => (
                        <MenuGroup
                            key={menuGroup.id} 
                            menuGroup={menuGroup} 
                        />
                    ))}
                </Container>
            </MainSection>
        </Layout>
    )
}

export default DiningRoom;
