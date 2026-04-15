@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface View: Itens da Viagem (Filha)'
define view entity Z_I_RAP_ITEM_VIAGEM
  as select from zrap_item_viagem
  association to parent Z_I_RAP_VIAGEM as _Viagem on $projection.viagem_uuid = _Viagem.viagem_uuid
{
  key item_uuid,
      viagem_uuid,
      item_id,
      tipo_despesa,
      @Semantics.amount.currencyCode: 'moeda'
      valor,
      moeda,

      @Semantics.largeObject: {
        mimeType: 'mimetype',                   // Aponta para o campo que guarda o tipo
        fileName: 'filename',                   // Aponta para o campo que guarda o nome
        contentDispositionPreference: #INLINE   // #INLINE abre no navegador, #ATTACHMENT baixa direto
      }
      attachment,

      @Semantics.mimeType: true
      mimetype,

      filename,

      local_last_changed_at,

      // Expondo a associação para a view pai
      _Viagem
}
