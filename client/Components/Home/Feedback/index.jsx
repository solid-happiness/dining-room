import React from 'react';
import styled from 'styled-components';
import Typography from '@material-ui/core/Typography';
import photo from './img.png';

const Container = styled.div`
    display: flex;
    align-items: center;
    justify-content: center;
`;

const Photo = styled.img`
    width: 100px;
    height: 100px;
    border-radius: 50%;
    overflow: hidden;

    @media screen and (max-width: 400px) {
        width: 50px;
        height: 50px;
    }

    @media screen and (min-width: 1200px) {
        width: 200px;
        height: 200px;
    }
`;

const ReviewContainer = styled.div`
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    align-items: center;
`;

const Review = styled(Typography)`
    && {
        max-width: 350px;
        margin: 15px;
    }
`;

const Feedback = () => (
  <Container>
    <Photo src={photo} alt="Фотография респондента" />
    <ReviewContainer>
      <Typography
        variant="h5"
        color="secondary"
      >
                Александров А.А.
      </Typography>
      <Review
        variant="body1"
        color="textSecondary"
      >
                Студенты должны хорошо учиться,
                а чтобы хорошо учиться, нужно хорошо пообедать.
                Еда - очень важно.
      </Review>
    </ReviewContainer>
  </Container>
);

export default Feedback;
