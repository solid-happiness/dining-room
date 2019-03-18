import React from 'react';
import styled from 'styled-components';
import Layout from '../Layout';
import Loader from '../Loader';

const Container = styled.div`
    position: relative;
    min-height: calc(100vh - 64px);
    margin-top: 64px;
`;

const DiningRoom = ({ match }) => {
    const { diningRoomSlug } = match.params;

    return (
        <Layout>
            <Container>
                <Loader fullscreen />
                <pre>
                    {JSON.stringify(match, null, 4)}
                </pre>
            </Container>
        </Layout>
    )
}

export default DiningRoom;
