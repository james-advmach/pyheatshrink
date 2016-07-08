from libc.stdint cimport uint8_t

cdef extern from "heatshrink/heatshrink_encoder.h":
    ctypedef struct heatshrink_encoder:
        uint8_t window_sz2
        uint8_t lookahead_sz2

    ctypedef enum HSE_sink_res:
        HSER_SINK_OK,
        HSER_SINK_ERROR_NULL = -1
        HSER_SINK_ERROR_MISUSE = -1

    ctypedef enum HSE_poll_res:
        HSER_POLL_EMPTY
        HSER_POLL_MORE
        HSER_POLL_ERROR_NULL = -1
        HSER_POLL_ERROR_MISUSE = -2

    ctypedef enum HSE_finish_res:
        HSER_FINISH_DONE
        HSER_FINISH_MORE
        HSER_FINISH_ERROR_NULL = -1

    heatshrink_encoder* heatshrink_encoder_alloc(uint8_t window_sz2, uint8_t lookahead_sz2)

    void heatshrink_encoder_free(heatshrink_encoder* hse)

    HSE_sink_res heatshrink_encoder_sink(heatshrink_encoder* hse, uint8_t* in_buf,
                                         size_t size, size_t* input_size)

    HSE_poll_res heatshrink_encoder_poll(heatshrink_encoder* hse, uint8_t *out_buf,
                                         size_t out_buf_size, size_t* output_size)

    HSE_finish_res heatshrink_encoder_finish(heatshrink_encoder* hse)


cdef extern from "heatshrink/heatshrink_decoder.h":
    ctypedef struct heatshrink_decoder:
        pass

    cdef enum HSD_sink_res:
        HSD_SINK_OK,
        HSDR_SINK_ERROR_NULL = -1
        HSDR_SINK_ERROR_MISUSE = -1

    cdef enum HSD_poll_res:
        HSDR_POLL_EMPTY
        HSDR_POLL_MORE
        HSDR_POLL_ERROR_NULL = -1
        HSDR_POLL_ERROR_MISUSE = -2

    cdef enum HSD_finish_res:
        HSDR_FINISH_DONE
        HSDR_FINISH_MORE
        HSDR_FINISH_ERROR_NULL = -1

    heatshrink_decoder* heatshrink_decoder_alloc(uint8_t window_sz2, uint8_t lookahead_sz2)

    void heatshrink_decoder_free(heatshrink_decoder* hse)

    HSD_sink_res heatshrink_decoder_sink(heatshrink_decoder* hse, uint8_t* in_buf,
                                         size_t size, size_t* input_size)

    HSD_poll_res heatshrink_decoder_poll(heatshrink_decoder* hse, uint8_t *out_buf,
                                         size_t out_buf_size, size_t* output_size)

    HSD_finish_res heatshrink_decoder_finish(heatshrink_decoder* hse)
