import React from 'react';
import styled from 'styled-components';
import ExpansionPanel from '@material-ui/core/ExpansionPanel';
import ExpansionPanelSummary from '@material-ui/core/ExpansionPanelSummary';
import ExpansionPanelDetails from '@material-ui/core/ExpansionPanelDetails';
import Typography from '@material-ui/core/Typography';
import GridListMaterialUI from '@material-ui/core/GridList';
import GridListTileMaterialUI from '@material-ui/core/GridListTile';
import GridListTileBar from '@material-ui/core/GridListTileBar';
import ExpandMoreIcon from '@material-ui/icons/ExpandMore';
import IconButton from '@material-ui/core/IconButton';
import { faShoppingBasket } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

const MenuGroupContainer = styled(ExpansionPanel)`
    && {
        margin-top: 15px;
        width: 100%;
        border-radius: 4px;
    }
`;

const Summary = styled(Typography)`
    && {
        font-size: 1.1rem;
        font-weight: 400;
    }
`;

const GridList = styled(GridListMaterialUI)`
    && {
        justify-content: center;
    }
`;

const GridListTile = styled(GridListTileMaterialUI)`
    && {
        min-width: 250px;
    }
`;

const SubHeaderSection = styled.p`
    && {
        margin: 0;
    }
`;

const getSubheader = ({ 
    calorific,
    proteins,
    fats,
    carbohydrates,
    price,
    portion
}) => (
    <>
    <SubHeaderSection>{`Цена: ${price}`}</SubHeaderSection>
    <SubHeaderSection>{`К/Б/Ж/У: ${Number(calorific / 1000)}/${proteins}/${fats}/${carbohydrates}`}</SubHeaderSection>
    <SubHeaderSection>{`Порция: ${portion}`}</SubHeaderSection>
    </>
);

const MenuGroup = ({ menuGroup }) => (
    <MenuGroupContainer>
        <ExpansionPanelSummary expandIcon={<ExpandMoreIcon />} >
            <Summary variant="body1" color="primary">
                {menuGroup.name}
            </Summary>
        </ExpansionPanelSummary>
        <ExpansionPanelDetails>
            <GridList>
                {menuGroup.dishes.map(dish => (
                    <GridListTile key={dish.id}>
                        <img src={dish.img} alt={dish.name} />
                        <GridListTileBar
                            title={dish.name}
                            subtitle={getSubheader(dish)}
                            actionIcon={
                                <IconButton>
                                    <FontAwesomeIcon
                                        icon={faShoppingBasket}
                                        color="white"
                                    />
                                </IconButton>
                            }
                        />
                    </GridListTile>
                ))}
            </GridList>
        </ExpansionPanelDetails>
    </MenuGroupContainer>
);

export default MenuGroup;
