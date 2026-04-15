@EndUserText.label: 'Projection View: Itens'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity Z_C_RAP_ITEM_VIAGEM
  as projection on Z_I_RAP_ITEM_VIAGEM
{
  key item_uuid,
      viagem_uuid,
      item_id,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'Z_I_RAP_TIPO_DESP', element: 'TipoDespesa' } }]
      tipo_despesa,
      valor,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency' } }]
      moeda,
      
      attachment,
      mimetype,
      filename,
      
      local_last_changed_at,

      /* Redirecionando a Associação para a view de consumo pai */
      _Viagem : redirected to parent Z_C_RAP_VIAGEM
}
