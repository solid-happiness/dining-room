import React from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';
import { withStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import Card from '@material-ui/core/Card';
import CardHeader from '@material-ui/core/CardHeader';
import CardMedia from '@material-ui/core/CardMedia';
import { CardContent } from '@material-ui/core';

const Container = styled.section`
    display: grid;
    grid: 1fr / 300px 1fr;
    justify-items: center;
    margin-top: 15px;
    
    @media screen and (max-width: 720px) {
        grid: 1fr 1fr / 1fr;
    }
`;

const Appearance = styled.img`
    width: 30%;
    min-width: 250px;
    margin-right: 30px;
    border-radius: 4px;
    overflow: hidden;
`;

const RoomDescription = ({ 
    name,
    img,
    description,
    classes,
    openTime,
    closeTime,
 }) => (
    <Card>
        <CardHeader
            title={name}
            classes={{
                title: classes.title,
            }}
            titleTypographyProps={{
                color: 'secondary',
            }}
            subheader={`Время работы: ${openTime}:${closeTime}`}
        />
        {img && (
            <CardMedia
                image={img}
                title={description}
                className={classes.media}
            />
        )}
        {/* <Container>
            <Typography color="textSecondary">
                {description}
            </Typography>
        </Container> */}
        <CardContent>
            {description}
        </CardContent>
    </Card>
)

RoomDescription.defaultProps = {
    name: '',
    description: '',
    img: '',
}

RoomDescription.propTypes = {
    name: PropTypes.string,
    description: PropTypes.string,
    img: PropTypes.string,
};

const styles = {
    title: {
        fontWeight: 500,
    },
    media: {
        padding: '120px',
    }
}

export default withStyles(styles)(RoomDescription);
